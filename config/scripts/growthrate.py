
import rich
import pyperclip

from rich.console import Console
from rich.prompt import FloatPrompt

# Show prompts
console = Console()
num1 = FloatPrompt.ask("Old value")
num2 = FloatPrompt.ask("New value")

# Calculate the growth rate
gr = ((num2-num1)/num1)
percentage = "{:.2%}".format(gr)

# Print result to the console
console.print(percentage, style="bold")

# Copy result into the system clipboard
pyperclip.copy(percentage)
print("Result has been copied to the clipboard!")
