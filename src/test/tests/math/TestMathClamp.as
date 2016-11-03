package tests.math
{
	import com.ar.math.Maths;

	import org.flexunit.Assert;

	/**
	 * @author Alan Ross
	 * @version 0.1
	 */
	public final class TestMathClamp
	{
		public function TestMathClamp()
		{
		}

		[Test(description="")]
		public function test1():void
		{
			var expected:Number = 0.1;
			var result:Number = Maths.clamp( 0.1, 0.0, 1.0 );
			Assert.assertEquals( expected, result );
		}

		[Test(description="")]
		public function test2():void
		{
			var expected:Number = 0.0;
			var result:Number = Maths.clamp( 0.0, 0.0, 1.0 );
			Assert.assertEquals( expected, result );
		}

		[Test(description="")]
		public function test3():void
		{
			var expected:Number = 1.0;
			var result:Number = Maths.clamp( 1.0, 0.0, 1.0 );
			Assert.assertEquals( expected, result );
		}

		[Test(description="")]
		public function test4():void
		{
			var expected:Number = 0.0;
			var result:Number = Maths.clamp( -0.1, 0.0, 1.0 );
			Assert.assertEquals( expected, result );
		}

		[Test(description="")]
		public function test5():void
		{
			var expected:Number = 1.0;
			var result:Number = Maths.clamp( 1.1, 0.0, 1.0 );
			Assert.assertEquals( expected, result );
		}

		[Test(description="")]
		public function test6():void
		{
			var expected:int = 1;
			var result:int = Maths.clamp( 1, 0, 100 );
			Assert.assertEquals( expected, result );
		}

		[Test(description="")]
		public function test7():void
		{
			var expected:int = 0;
			var result:int = Maths.clamp( 0, 0, 100 );
			Assert.assertEquals( expected, result );
		}

		[Test(description="")]
		public function test8():void
		{
			var expected:int = 100;
			var result:int = Maths.clamp( 100, 0, 100 );
			Assert.assertEquals( expected, result );
		}

		[Test(description="")]
		public function test9():void
		{
			var expected:int = 0;
			var result:int = Maths.clamp( -1, 0, 100 );
			Assert.assertEquals( expected, result );
		}

		[Test(description="")]
		public function test10():void
		{
			var expected:int = 100;
			var result:int = Maths.clamp( 101, 0, 100 );
			Assert.assertEquals( expected, result );
		}

		public function toString():String
		{
			return "[TestMathClamp]";
		}
	}
}