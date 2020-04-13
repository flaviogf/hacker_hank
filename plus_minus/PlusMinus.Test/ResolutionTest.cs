using PlusMinus.Answer;
using Xunit;

namespace PlusMinus.Test
{
    public class ResolutionTest
    {
        [Fact]
        public void Resolve_WhenIsInformedTheNumbersMinusFourThreeMinusNineZeroFourAndOne_ShouldReturnZeroPointFiveZeroPointThreeAndZeroPointOneAllOfTheseWithSixPointsOfPrecisionAsString()
        {
            var resolution = new Resolution();

            var numbers = new int[] { -4, 3, -9, 0, 4, 1 };

            var expected = new string[] { "0.500000", "0.333333", "0.166667" };

            Assert.Equal(expected, resolution.Execute(numbers));
        }
    }
}