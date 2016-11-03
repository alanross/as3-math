package tests.math
{
	import com.ar.math.Rand;

	import org.flexunit.Assert;

	/**
	 * @author Alan Ross
	 * @version 0.1
	 */
	public final class TestMathRandom
	{
		public function TestMathRandom()
		{
		}

		[Test(description="")]
		public function testSeededRandom():void
		{
			Rand.seed = 0.0;
			Assert.assertEquals( 0.0, Rand.sRandom() );
			Assert.assertEquals( 0.0, Rand.sRandom( -1.0 ) );
			Assert.assertEquals( 0.0, Rand.sRandom( 1.0 ) );
			Assert.assertEquals( 0.0, Rand.sRandom( 100.0 ) );

			Rand.seed = 1.0;
			Assert.assertEquals( 1.0, Rand.sRandom() );
			Assert.assertEquals( -1.0, Rand.sRandom( -1.0 ) );
			Assert.assertEquals( 1.0, Rand.sRandom( 1.0 ) );
			Assert.assertEquals( 100.0, Rand.sRandom( 100.0 ) );
		}

		[Test(description="")]
		public function testSeededRandomMinMax():void
		{
			Rand.seed = 0.0;
			Assert.assertEquals( 0.0, Rand.sRandomMinMax( 0.0, 0.0 ) );
			Assert.assertEquals( 0.0, Rand.sRandomMinMax( 0.0, 1.0 ) );	// returns min, as is smalled random
			Assert.assertEquals( -1.0, Rand.sRandomMinMax( -1.0, 1.0 ) ); // returns min, as is smalled random
			Assert.assertEquals( -1.0, Rand.sRandomMinMax( -1.0, 0.0 ) ); // returns min, as is smalled random

			Rand.seed = 1.0;
			Assert.assertEquals( 0.0, Rand.sRandomMinMax( 0.0, 0.0 ) );
			Assert.assertEquals( 1.0, Rand.sRandomMinMax( 0.0, 1.0 ) );	// returns max, as is largest random
			Assert.assertEquals( 1.0, Rand.sRandomMinMax( -1.0, 1.0 ) );	// returns max, as is largest random
			Assert.assertEquals( 0.0, Rand.sRandomMinMax( -1.0, 0.0 ) );	// returns max, as is largest random
		}

		[Test(description="")]
		public function testSeededRandomMinMaxInt():void
		{
			Rand.seed = 0.0;
			Assert.assertEquals( 0, Rand.sRandomMinMax( 0, 0 ) );
			Assert.assertEquals( 0, Rand.sRandomMinMax( 0, 10 ) );	 // returns min, as is smalled random
			Assert.assertEquals( -10, Rand.sRandomMinMax( -10, 10 ) ); // returns min, as is smalled random
			Assert.assertEquals( -10, Rand.sRandomMinMax( -10, 0 ) ); // returns min, as is smalled random

			Rand.seed = 1.0;
			Assert.assertEquals( 0, Rand.sRandomMinMax( 0, 0 ) );
			Assert.assertEquals( 10, Rand.sRandomMinMax( 0, 10 ) );	// returns max, as is largest random
			Assert.assertEquals( 10, Rand.sRandomMinMax( -10, 10 ) );	// returns max, as is largest random
			Assert.assertEquals( 0, Rand.sRandomMinMax( -10, 0 ) );	// returns max, as is largest random
		}

		[Test(description="")]
		public function testSeededRandomBool():void
		{
			const n:int = 10;

			for( var i:int = 1; i < n; ++i )
			{
				var chance:Number = Rand.seed = i / 10.0; // 0.1, 0.2, ..., 1.0

				Rand.seed = 0.0;
				Assert.assertEquals( true, Rand.sRandomBool( chance ) );

				Rand.seed = 1.0;
				Assert.assertEquals( false, Rand.sRandomBool( chance ) );
			}
		}

		public function toString():String
		{
			return "[TestMathRandom]";
		}
	}
}