package tests.math
{
	import com.ar.math.Maths;

	import org.flexunit.Assert;

	/**
	 * @author Alan Ross
	 * @version 0.1
	 */
	public final class TestMathNormalize
	{
		public function TestMathNormalize()
		{
		}

		[Test(description="")]
		public function test1():void
		{
			var expected:Number = 0.1;
			var result:Number = Maths.normalize( 0.1, 0.0, 1.0 );
			Assert.assertEquals( expected, result );
		}

		[Test(description="")]
		public function test2():void
		{
			var expected:Number = 0.1;
			var result:Number = Maths.normalize( 0.2, 0.0, 2.0 );
			Assert.assertEquals( expected, result );
		}

		[Test(description="")]
		public function test3():void
		{
			var expected:Number = 0.0;
			var result:Number = Maths.normalize( 1.0, 1.0, 10.0 );
			Assert.assertEquals( expected, result );
		}

		public function toString():String
		{
			return "[TestMathNormalize]";
		}
	}
}