using Xunit;

public class LadderLengthTests
{
    [Fact]
    public void FindsShortestTransformationSequence()
    {
        var words = new[] { "hot", "dot", "dog", "lot", "log", "cog" };

        Assert.Equal(5, Solution.LadderLength("hit", "cog", words));
    }

    [Fact]
    public void MissingEndWordMakesTransformationImpossible()
    {
        Assert.Equal(0, Solution.LadderLength("hit", "cog", ["hot", "dot", "dog"]));
    }

    [Fact]
    public void IdenticalWordsHaveLengthOne()
    {
        Assert.Equal(1, Solution.LadderLength("hit", "hit", []));
    }
}

