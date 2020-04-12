using CompareTheTriplets.Answer;
using System.Collections.Generic;
using Xunit;

namespace CompareTheTriplets.Test
{
    public class ResolutionTest
    {
        [Fact]
        public void Should_Return_2_and_1_When_The_First_List_Has_The_Numbers_17_28_30_and_The_Second_List_Has_The_Numbers_99_16_8()
        {
            var a = new List<int> { 17, 28, 30 };

            var b = new List<int> { 99, 16, 8 };

            var resolution = new Resolution();

            Assert.Equal(new List<int> { 2, 1 }, resolution.Execute(a, b));
        }
    }
}
