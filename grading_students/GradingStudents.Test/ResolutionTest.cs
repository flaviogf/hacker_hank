using GradingStudents.Answer;
using System.Collections.Generic;
using Xunit;

namespace GradingStudents.Test
{
    public class ResolutionTest
    {
        public static IEnumerable<object[]> GetGrades()
        {
            yield return new object[] { new List<int> { 73, 67, 38, 33 }, new List<int> { 75, 67, 40, 33 } };
        }

        [Theory]
        [MemberData(nameof(GetGrades))]
        public void Execute_When_Given_An_Array_Of_Grades_Should_Return_The_Grades_Rounded(List<int> grades, List<int> expected)
        {
            var resolution = new Resolution();

            Assert.Equal(expected, resolution.Execute(grades));
        }
    }
}
