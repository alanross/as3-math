package tests.math
{
	import com.ar.math.Maths;

	import org.flexunit.Assert;

	/**
	 * @author Alan Ross
	 * @version 0.1
	 */
	public final class TestMathAverage
	{
		public function TestMathAverage()
		{
		}

		[Test(description="")]
		public function test1():void
		{
			var expected:Number = 2;
			var result:Number = Maths.average( [ 2, 2, 2 ] );
			Assert.assertEquals( expected, result );
		}

		[Test(description="")]
		public function test2():void
		{
			var expected:Number = 2;
			var result:Number = Maths.average( [ 1, 2, 3 ] );
			Assert.assertEquals( expected, result );
		}

		[Test(description="")]
		public function test3():void
		{
			var expected:Number = 2.5;
			var result:Number = Maths.average( [ 1, 2, 3, 4 ] );
			Assert.assertEquals( expected, result );
		}

		[Test(description="")]
		public function test4():void
		{
			var expected:Number = -1;
			var result:Number = Maths.average( [ -1, -1, -1, -1 ] );
			Assert.assertEquals( expected, result );
		}

		[Test(description="")]
		public function test5():void
		{
			var expected:Number = 0;
			var result:Number = Maths.average( [ -3, 3, 0 ] );
			Assert.assertEquals( expected, result );
		}

		[Test(description="")]
		public function test6():void
		{
			var expected:Number = Number.MAX_VALUE;
			var result:Number = Maths.average( [ Number.MAX_VALUE, Number.MAX_VALUE ] );
			Assert.assertEquals( expected, result );
		}

		[Test(description="")]
		public function test7():void
		{
			var expected:Number = -Number.MAX_VALUE;
			var result:Number = Maths.average( [ -Number.MAX_VALUE, -Number.MAX_VALUE ] );
			Assert.assertEquals( expected, result );
		}

		public function toString():String
		{
			return "[TestMathAverage]";
		}
	}
}