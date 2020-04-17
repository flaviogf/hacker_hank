using System.Collections.Generic;
using System.Linq;

namespace GradingStudents.Answer
{
    public class Resolution
    {
        public List<int> Execute(List<int> grades)
        {
            return grades.Select(Round).ToList();
        }

        public int Round(int grade)
        {
            if (grade < 38)
            {
                return grade;
            }

            int nextMultiplyOf5 = NextMultiplyOf5(grade);

            if (nextMultiplyOf5 - grade < 3)
            {
                return nextMultiplyOf5;
            }

            return grade;
        }

        private int NextMultiplyOf5(int number)
        {
            return number - (number % 5) + 5;
        }
    }
}
