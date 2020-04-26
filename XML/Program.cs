using System;
using System.Xml.Xsl;
using System.Collections.Generic;
using System.IO;
using System.Xml;

namespace XmlLab
{
    class Program
    {
        static void Main(string[] args)
        {
            var xslt = new XslCompiledTransform();

            xslt.Load("XmlToHtml.xsl");
            Console.WriteLine("Xsl is downloaded for Html");
            xslt.Transform("schedule.xml", "schedule.html");
            Console.WriteLine("Html format: schedule.html");

            xslt.Load("XmlToTxt.xsl");
            Console.WriteLine("Xsl is downloaded for Txt");
            xslt.Transform("schedule.xml", "schedule.txt");
            Console.WriteLine("Txt format: schedule.txt");

            Console.WriteLine("xPath queries: saved in xPath.txt");
            var xPath = new List<string>()
            {
                "//lesson",
                "//classroom[not(. = ./following::classroom)]",
                "//lesson[type='Практика']",
                "//lesson[type='Лекция' and classroom='407']",
                "//lesson[type='Практика' and classroom='239']/teacher[not(. = ./following::teacher)]",
                "//day/lesson[last()]"
            };
            using (var output = new StreamWriter("xPath.txt"))
            {
                int i = 1;
                var xmlDoc = new XmlDocument();
                xmlDoc.Load("schedule.xml");
                foreach (var xp in xPath)
                {
                    output.WriteLine(i + ")");
                    var titleNodes = xmlDoc.SelectNodes(xp);
                    if (titleNodes != null)
                        foreach (XmlElement titleNode in titleNodes)
                        {
                            if (titleNode != null)
                                output.WriteLine(titleNode.InnerXml);
                        }

                    Console.WriteLine("Query: " + xp + " is completed");
                    i++;
                }
                output.WriteLine(i + ")");
                var cntNode = xmlDoc.SelectNodes("//lesson")?.Count;
                output.WriteLine(cntNode);

                Console.WriteLine("Query: count(//lesson) is completed");
            }

            Console.ReadKey();
        }
    }
}
