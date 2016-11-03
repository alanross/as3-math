package tests.math
{
	import com.ar.math.Maths;

	import org.flexunit.Assert;

	/**
	 * @author Alan Ross
	 * @version 0.1
	 */
	public final class TestMathRad2Deg
	{
		public function TestMathRad2Deg()
		{
		}

		[Test(description="")]
		public function test1():void
		{
			var expected:Number = 0.0;
			var result:Number = Maths.rad2deg( 0.0 );
			Assert.assertEquals( expected, result );
		}

		[Test(description="")]
		public function test2():void
		{
			var expected:Number = 360;
			var result:Number = Maths.rad2deg( 6.283185307179586 );
			Assert.assertEquals( expected, result );
		}

		public function toString():String
		{
			return "[TestMathRad2Deg]";
		}
	}
}