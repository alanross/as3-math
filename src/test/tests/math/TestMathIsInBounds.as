package tests.math
{
	import com.ar.math.Maths;

	import org.flexunit.Assert;

	/**
	 * @author Alan Ross
	 * @version 0.1
	 */
	public final class TestMathIsInBounds
	{
		public function TestMathIsInBounds()
		{
		}

		[Test(description="")]
		public function test1():void
		{
			var expected:Boolean = true;
			var result:Boolean = Maths.isInBounds( 0.1, 0.0, 1.0 );
			Assert.assertEquals( expected, result );
		}

		[Test(description="")]
		public function test2():void
		{
			var expected:Boolean = true;
			var result:Boolean = Maths.isInBounds( 0.0, 0.0, 1.0 );
			Assert.assertEquals( expected, result );
		}

		[Test(description="")]
		public function test3():void
		{
			var expected:Boolean = true;
			var result:Boolean = Maths.isInBounds( 1.0, 0.0, 1.0 );
			Assert.assertEquals( expected, result );
		}

		[Test(description="")]
		public function test4():void
		{
			var expected:Boolean = false;
			var result:Boolean = Maths.isInBounds( -0.1, 0.0, 1.0 );
			Assert.assertEquals( expected, result );
		}

		[Test(description="")]
		public function test5():void
		{
			var expected:Boolean = false;
			var result:Boolean = Maths.isInBounds( 1.1, 0.0, 1.0 );
			Assert.assertEquals( expected, result );
		}

		[Test(description="")]
		public function test6():void
		{
			var expected:Boolean = true;
			var result:Boolean = Maths.isInBounds( 1, 0, 100 );
			Assert.assertEquals( expected, result );
		}

		[Test(description="")]
		public function test7():void
		{
			var expected:Boolean = true;
			var result:Boolean = Maths.isInBounds( 0, 0, 100 );
			Assert.assertEquals( expected, result );
		}

		[Test(description="")]
		public function test8():void
		{
			var expected:Boolean = true;
			var result:Boolean = Maths.isInBounds( 100, 0, 100 );
			Assert.assertEquals( expected, result );
		}

		[Test(description="")]
		public function test9():void
		{
			var expected:Boolean = false;
			var result:Boolean = Maths.isInBounds( -1, 0, 100 );
			Assert.assertEquals( expected, result );
		}

		[Test(description="")]
		public function test10():void
		{
			var expected:Boolean = false;
			var result:Boolean = Maths.isInBounds( 101, 0, 100 );
			Assert.assertEquals( expected, result );
		}


		public function toString():String
		{
			return "[TestMathIsInBounds]";
		}
	}
}