// Online C# compiler (editor) for free
// Write and run C# online using this editor.

using System;

public class HelloWorld
{public static void Main(string[] args) {
        Console.WriteLine("Wie viele Tage hat der Monat?");
string input = Console.ReadLine();

        int tage;

if (int.TryParse(input, out tage))
{
    
}
else
{
    Console.WriteLine("Fehler: Ganzzahl erwartet");
}
if (tage >= 28 && tage <= 31)
{
    // Zahl ist gültig
}
else
{
    Console.WriteLine("Fehler: Zahl zwischen 28 und 31 erwartet");
}

int sekunden = tage * 24 * 60 * 60;

Console.WriteLine("Der Monat hat " + sekunden + " Sekunden.");

    }
}
