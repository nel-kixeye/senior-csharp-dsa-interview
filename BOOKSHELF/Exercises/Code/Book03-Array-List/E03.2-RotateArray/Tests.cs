using Xunit;
public class RotateArrayTests { [Theory]
 [InlineData(new[] { 1,2,3,4,5,6,7 },3,new[] { 5,6,7,1,2,3,4 })] [InlineData(new[] { 1,2,3 },0,new[] { 1,2,3 })] [InlineData(new[] { 1,2,3 },3,new[] { 1,2,3 })] [InlineData(new[] { 1,2 },5,new[] { 2,1 })] [InlineData(new[] { 1 },100,new[] { 1 })]
 public void RotatesInPlace(int[] nums,int k,int[] expected) { Solution.Rotate(nums,k); Assert.Equal(expected,nums); } }
