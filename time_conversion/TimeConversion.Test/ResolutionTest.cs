using TimeConversion.Answer;
using Xunit;

namespace TimeConversion.Test
{
    public class ResolutionTest
    {
        [Fact]
        public void Execute_When_Is_Given_A_Time_AM_PM_Format_Should_Convert_It_To_24_Hour_Time()
        {
            var resolution = new Resolution();

            Assert.Equal("19:05:45", resolution.Execute("07:05:45PM"));
        }
    }
}