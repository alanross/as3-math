package tests.math
{
	import com.ar.math.Maths;

	import org.flexunit.Assert;

	/**
	 * @author Alan Ross
	 * @version 0.1
	 */
	public final class TestMathSum
	{
		public function TestMathSum()
		{
		}

		[Test(description="")]
		public function test1():void
		{
			var expected:Number = 3;
			var result:Number = Maths.sum( [ 1, 1, 1 ] );
			Assert.assertEquals( expected, result );
		}

		[Test(description="")]
		public function test2():void
		{
			var expected:Number = 0;
			var result:Number = Maths.sum( [ -1, 1, -1, 1 ] );
			Assert.assertEquals( expected, result );
		}

		public function toString():String
		{
			return "[TestMathSum]";
		}
	}
}