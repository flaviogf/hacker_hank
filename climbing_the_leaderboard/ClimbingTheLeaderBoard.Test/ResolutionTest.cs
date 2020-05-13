using ClimbingTheLeaderBoard.Answer;
using Xunit;

namespace ClimbingTheLeaderBoard.Test
{
    public class ResolutionTest
    {
        [Fact]
        public void Execute_WhenIsInformedAnScoresArrayThatRepresentsTheScoresAlreadyRegisteredWithTheElementsOneHundredOneHundredFiftyFourtyFourtyTwentyAndTenAndAnScoresArrayThatRepresentsTheAliceScores_ShouldReturnAnArrayWithTheElementsSixFourTwoAndOneThatRepresentsTheAliceRankings()
        {
            var resolution = new Resolution();

            var registeredScores = new int[] { 100, 100, 50, 40, 40, 20, 10 };

            var playerScores = new int[] { 5, 25, 50, 120 };

            var expected = new int[] { 6, 4, 2, 1 };

            var result = resolution.Execute(registeredScores, playerScores);

            Assert.Equal(expected, result);
        }
    }
}