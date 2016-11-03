package tests.math
{
	import com.ar.math.Maths;

	import org.flexunit.Assert;

	/**
	 * @author Alan Ross
	 * @version 0.1
	 */
	public final class TestMathScale
	{
		public function TestMathScale()
		{
		}

		[Test(description="")]
		public function test1():void
		{
			var expected:Number = 10.0;
			var result:Number = Maths.scale( 0.1, 0.0, 1.0, 0.0, 100.0 );
			Assert.assertEquals( expected, result );
		}

		[Test(description="")]
		public function test2():void
		{
			var expected:Number = -50;
			var result:Number = Maths.scale( -0.5, -1.0, 1.0, -100.0, 100.0 );
			Assert.assertEquals( expected, result );
		}

		public function toString():String
		{
			return "[TestMathScale]";
		}
	}
}