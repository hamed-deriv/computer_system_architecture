using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Computer_System_Architecture_Assembler
{
    class Program
    {
        static string Input, Output;

        static int InputParser()
        {
            string TempOperator, AddressingMode, TempDestination, TempSource, TempAddress;

            Input = Input.ToLower();
            TempOperator = Input.Substring(0, 3);
            AddressingMode = Input.Substring(4, 1);
            TempDestination = Input.Substring(6, 2);
            TempSource = Input.Substring(9, 2);
            TempAddress = Input.Substring(12);

            if ((TempOperator == "add" || TempOperator == "and") && (TempSource == "ac" || TempSource == "ac"))
            {
                Console.WriteLine("-> Error! you can't use AC as destination or source in ADD or AND.");
                return (0);
            }

            Output = "";

            switch (TempOperator)
            {
                case "clr":
                    Output += "0000 ";
                    break;
                case "inc":
                    Output += "0001 ";
                    break;
                case "cmp":
                    Output += "0010 ";
                    break;
                case "clc":
                    Output += "0011 ";
                    break;
                case "mov":
                    Output += "0100 ";
                    break;
                case "add":
                    Output += "0101 ";
                    break;
                case "and":
                    Output += "0110 ";
                    break;
                case "jmc":
                    Output += "0111 ";
                    break;
                case "jmn":
                    Output += "1000 ";
                    break;
                case "jmz":
                    Output += "1001 ";
                    break;
                case "jme":
                    Output += "1010 ";
                    break;
                case "jmp":
                    Output += "1011 ";
                    break;
                case "cal":
                    Output += "1100 ";
                    break;
                case "ret":
                    Output += "1101 ";
                    break;
                default:
                    Console.WriteLine("-> Error! operator [" + TempOperator.ToUpper() + "] is not available.");
                    return (0);
            }

            switch (AddressingMode)
            {
                case "d":
                    Output += "00 ";
                    break;
                case "i":
                    Output += "01 ";
                    break;
                case "v":
                    Output += "10 ";
                    break;
                case "r":
                    Output += "11 ";
                    break;
                case "x":
                    Output += "00 ";
                    break;
                default:
                    Console.WriteLine("-> Error! addressing mode [" + AddressingMode.ToUpper() + "] is not available.");
                    return (0);
            }

            switch (TempDestination)
            {
                case "me":
                    Output += "000 ";
                    break;
                case "ac":
                    Output += "001 ";
                    break;
                case "r0":
                    Output += "010 ";
                    break;
                case "r1":
                    Output += "011 ";
                    break;
                case "r2":
                    Output += "100 ";
                    break;
                case "r3":
                    Output += "101 ";
                    break;
                case "r4":
                    Output += "110 ";
                    break;
                case "r5":
                    Output += "111 ";
                    break;
                case "xx":
                    Output += "000 ";
                    break;
                default:
                    Console.WriteLine("-> Error! destination [" + TempDestination.ToUpper() + "] is not available.");
                    return (0);
            }

            switch (TempSource)
            {
                case "me":
                    Output += "000 ";
                    break;
                case "ac":
                    Output += "001 ";
                    break;
                case "r0":
                    Output += "010 ";
                    break;
                case "r1":
                    Output += "011 ";
                    break;
                case "r2":
                    Output += "100 ";
                    break;
                case "r3":
                    Output += "101 ";
                    break;
                case "r4":
                    Output += "110 ";
                    break;
                case "r5":
                    Output += "111 ";
                    break;
                case "xx":
                    Output += "000 ";
                    break;
                default:
                    Console.WriteLine("-> Error! source [" + TempSource.ToUpper() + "] is not available.");
                    return (0);
            }

            switch (TempAddress.Trim())
            {
                case "0":
                    Output += "0000";
                    break;
                case "1":
                    Output += "0001";
                    break;
                case "2":
                    Output += "0010";
                    break;
                case "3":
                    Output += "0011";
                    break;
                case "4":
                    Output += "0100";
                    break;
                case "5":
                    Output += "0101";
                    break;
                case "6":
                    Output += "0110";
                    break;
                case "7":
                    Output += "0111";
                    break;
                case "8":
                    Output += "1000";
                    break;
                case "9":
                    Output += "1001";
                    break;
                case "10":
                    Output += "1010";
                    break;
                case "11":
                    Output += "1011";
                    break;
                case "12":
                    Output += "1100";
                    break;
                case "13":
                    Output += "1101";
                    break;
                case "14":
                    Output += "1110";
                    break;
                case "15":
                    Output += "1111";
                    break;
                case "xx":
                    Output += "0000";
                    break;
                default:
                    Console.WriteLine("-> Error! address [" + TempAddress + "] is out of range.");
                    return (0);
            }

            return (1);
        }

        static void Main(string[] args)
        {
            Console.WriteLine("+-----------------------------------------------------------------------------+");
            Console.WriteLine("|               Computer System Architecture Project Assembler                |");
            Console.WriteLine("|          Programmers: Hamed Rezaee, Mohammad Hossein Khoram Nezhad          |");
            Console.WriteLine("|-----------------------------------------------------------------------------|");
            Console.WriteLine("|  Notes:                                                                     |");
            Console.WriteLine("|   - Format -> [Operator] [Addressing Mode] [Destination] [Source] [Address] |");
            Console.WriteLine("|   - Operator -> [CLR, INC, CMP, CLC, MOV, ADD, AND]                         |");
            Console.WriteLine("|   - Jump Conditions -> [JMP, JMC, JMN, JME, JMZ,  CAL, RET]                 |");
            Console.WriteLine("|   - Addressing Mode -> [D: Direct, I: Indirect, R: Register, V: Relative]   |");
            Console.WriteLine("|   - Source, Destination -> [ME, AC, R0 - R5]                                |");
            Console.WriteLine("|   - Address -> [0 - 16]                                                     |");
            Console.WriteLine("+-----------------------------------------------------------------------------+");

            Console.Title = "Computer System Architecture Project Assembler";

            string Address = "c:\\Assembler Output.txt";
            Console.Write("\n-> Please enter output file address: ");
            Address = Console.ReadLine();
            if (Address == "")
            {
                Address = "c:\\Assembler Output.txt";
                Console.Write("-> File with default path [C:\\Assembler Output.txt] has been created...");
            }
            System.IO.StreamWriter FileWriter = new System.IO.StreamWriter(Address);

            while (true)
            {
                try
                {
                    Console.Write("\n-> ");
                    Input = Console.ReadLine();
                    if (Input.Length < 13)
                    {
                        Console.WriteLine("-> Error! format of command is incorrect.");
                        Console.Write("-> ");
                    }

                    if (InputParser() == 1)
                    {
                        Console.WriteLine("-> " + Output);
                        FileWriter.WriteLine(Output.Replace(" ", ""));
                        FileWriter.Flush();
                    }
                }
                catch
                {
                    FileWriter.Close();
                }
            }
        }
    }
}