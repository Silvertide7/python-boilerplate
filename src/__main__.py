import os


def print_hi(name: str) -> None:
    # Use a breakpoint in the code line below to debug your script.
    print(
        f"Hi, {name}, welcome to {os.environ.get('PROJECT')}"
    )  # Press F9 to toggle the breakpoint.


# Press the green button in the gutter to run the script.
if __name__ == "__main__":
    print_hi("PyCharm")

# See PyCharm help at https://www.jetbrains.com/help/pycharm/
