// Online C# compiler (editor) for free
// Write and run C# online using this editor.

using System;

public class HelloWorld {
    public static void Main(string[] args) {
        Console.WriteLine("Wievel km hast du noch?");
        double i = Convert.ToDouble(Console.ReadLine());


        if (i > 42)
        {
            Console.WriteLine("Du Schaffst das nicht!");
        }

        else
        {
            double r = (i / 0.4);
            Console.WriteLine("Du kannst " + r + " runden machen.");
        }
    }

}
