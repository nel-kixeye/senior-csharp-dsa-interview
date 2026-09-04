using Xunit;
public class MoveZeroesTests { [Theory]
 [InlineData(new[] { 0,1,0,3,12 }, new[] { 1,3,12,0,0 })] [InlineData(new[] { 0,0,0 }, new[] { 0,0,0 })] [InlineData(new[] { 1,2,3 }, new[] { 1,2,3 })] [InlineData(new[] { 0 }, new[] { 0 })] [InlineData(new[] { 1,2,0,0 }, new[] { 1,2,0,0 })]
 public void MovesZeroesInPlace(int[] nums, int[] expected) { Solution.MoveZeroes(nums); Assert.Equal(expected, nums); } }
