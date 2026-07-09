import re
from abc import ABC, abstractmethod
from pathlib import Path

BASE_HEADER = "Desktop Entry"


class Field(ABC):
    PATTERN = ""

    def __init__(self) -> None:
        super().__init__()
        self._find = re.compile(self.PATTERN)
        self._parent = None

    @abstractmethod
    def parse(self, match: re.Match) -> None:
        pass

    def match(self, line: str):
        return self._find.match(line)


class Name(Field):
    PATTERN = r"^Name(?:\[([a-zA-Z_@-]+)\])?\s*=\s*(.*)$"

    def __init__(self) -> None:
        self.names = {}
        super().__init__()

    def parse(self, match: re.Match) -> None:
        pass


class Exec(Field):
    PATTERN = r"^Exec\s*=\s*(.*)$"

    def __init__(self) -> None:
        self.program = ""
        self.args = []
        super().__init__()

    def parse(self, match: re.Match) -> None:
        cmd = match.group(1).strip()
        raw = []
        while cmd:
            left, _, right = cmd.partition(" ")
            if not left:
                cmd = right.strip()
                continue
            if not self.program:
                self.program = left.strip()
            else:
                raw.append(left.strip())
            cmd = right.strip()
        self.args = raw


class Icon(Field):
    PATTERN = r"^Icon\s*=\s*(.*)$"

    def __init__(self) -> None:
        self.name = ""
        super().__init__()

    def parse(self, match: re.Match) -> None:
        pass


class DesktopEntry:
    def __init__(self) -> None:
        self._parent = None
        self._sub = None
        self.name = Name()
        self.exec = Exec()
        self.icon = Icon()
        self._fields = [self.name, self.exec, self.icon]

    def parse(self, line: str):
        name = self.name.match(line)
        icon = self.icon.match(line)
        exec = self.exec.match(line)

        if name:
            self.name.parse(name)
        elif exec:
            self.exec.parse(exec)
        elif icon:
            self.icon.parse(icon)


class Desktop:
    PATTERN = r"\[Desktop\s+Entry\s+([A-Za-z])*\]"

    def __init__(self, path: Path) -> None:
        self.headpat = re.compile(self.PATTERN)
        self.path = path
        self.name = path.stem
        self.entrys = []

    def __enter__(self):
        self._file = self.path.read_text(encoding="utf-8", errors="ignore")
        scope = None
        for line in self._file.splitlines():
            match = self.headpat.match(line)
            if match:
                self.entrys.append(DesktopEntry())
                scope = self.entrys[-1]
                scope._parent = self
                if match.group(1):
                    scope._sub = match.group(1)
            elif scope:
                scope.parse(line)
        return self

    def close(self):
        if hasattr(self, "_file"):
            del self._file

    def __exit__(self, exc_type, exc_val, exc_tb):
        self.close()


class Files:
    def __init__(self, *paths: Path) -> None:
        self.files = {}
        for path in paths:
            path = path.resolve()
            if path.exists() and path.is_file() and path.suffix == ".desktop":
                with Desktop(path) as file:
                    self.files[file.name] = file
