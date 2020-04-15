using BirthdayCakeCandles.Answer;
using Xunit;

namespace BirthdayCakeCandles.Test
{
    public class ResolutionTest
    {
        [Theory]
        [InlineData(new object[] { new int[] { 3, 2, 1, 3 }, 2 })]
        [InlineData(new object[] { new int[] { 4, 4, 1, 3 }, 2 })]
        public void Execute_WhenGivenAnArrayOfNumbers_ShouldReturnTheQuantityOfTheTallestNumber(int[] numbers, int expected)
        {
            var resolution = new Resolution();

            Assert.Equal(expected, resolution.Execute(numbers));
        }
    }
}
