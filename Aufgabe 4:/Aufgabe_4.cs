// Online C# compiler (editor) for free
// Write and run C# online using this editor.

using System;

public class HelloWorld {
    public static void Main(string[] args) {
        Console.WriteLine ("Schreibe mir eine Ganzahl zwischen 1-12 auf");
        int A = Int32.Parse(Console.ReadLine());


        if (A == 1)
        {
            Console.WriteLine ("Janaur");
        }
        if (A == 2)
        {
            Console.WriteLine ("Februar");
        }
        if (A == 3)
        {
            Console.WriteLine ("März");
        }
        if (A == 4)
        {
            Console.WriteLine ("April");
        }
        if (A == 5)
        {
            Console.WriteLine ("Mai");
        }
        if (A == 6)
        {
            Console.WriteLine ("April");
        }
        if (A == 7)
        {
            Console.WriteLine ("Semptember");
        }
        if (A == 8)
        {
            Console.WriteLine ("Oktober");
        }
        if (A == 9)
        {
            Console.WriteLine ("November");
        }
        if (A == 10)
        {
            Console.WriteLine ("Dezember");
        }
        if (A == 11)
        {
            Console.WriteLine ("Platzhalter 11ter Monat");
        }
        if (A == 12)
        {
            Console.WriteLine ("Plathalter 12ter Monat");
        }
        else
            Console.WriteLine ("Ungeultige Eingabe");
    }
}
