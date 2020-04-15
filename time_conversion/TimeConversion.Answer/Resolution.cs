using System;

namespace TimeConversion.Answer
{
    public class Resolution
    {
        public string Execute(string time)
        {
            return DateTime.Parse(time).ToString("HH:mm:ss");
        }
    }
}