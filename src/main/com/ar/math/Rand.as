package com.ar.math
{
	import com.ar.core.error.ValueError;

	/**
	 * @author Alan Ross
	 * @version 0.1
	 */
	public final class Rand
	{
		/**
		 * Possibility to set a seed value to be used a random value for all seeded random functions.
		 * The value mus be between 0.0 and 1.0.
		 */
		public static var seed:Number = Math.random();

		/**
		 * generates a random number between 0 and given max value. Default max is 1.0.
		 */
		public static function random( max:Number = 1.0 ):Number
		{
			return Math.random() * max;
		}

		/**
		 * generates a random number between -1 and 1.
		 */
		public static function randomNegPos():Number
		{
			return Math.random() - Math.random();
		}

		/**
		 * generates a random number between min and max.
		 */
		public static function randomMinMax( min:Number, max:Number ):Number
		{
			return min + Math.random() * (max - min);
		}

		/**
		 * Generates a random number between given min and max integer values.
		 */
		public static function randomMinMaxInt( min:int, max:int ):int
		{
			return Maths.round( randomMinMax( min, max ) );
		}

		/**
		 * Returns a random boolean value. The return value is weighted by the chance value.
		 * E.g if chance is 0.8 returns true in 80% cases.
		 */
		public static function randomBool( chance:Number = 0.5 ):Boolean
		{
			return (random() < chance);
		}

		/**
		 * generates a seeded random number between 0 and given max value. Default max is 1.0.
		 */
		public static function sRandom( max:Number = 1.0 ):Number
		{
			if( !Maths.isInBounds( seed, 0.0, 1.0 ) )
			{
				throw new ValueError( "Seed value must be between 0.0 and 1.0. It is:" + seed );
			}

			return seed * max;
		}

		/**
		 * generates a seeded random number between min and max.
		 */
		public static function sRandomMinMax( min:Number, max:Number ):Number
		{
			if( !Maths.isInBounds( seed, 0.0, 1.0 ) )
			{
				throw new ValueError( "Seed value must be between 0.0 and 1.0. It is:" + seed );
			}

			return min + seed * (max - min);
		}

		/**
		 * Generates a seeded random number between given min and max integer values.
		 */
		public static function sRandomMinMaxInt( min:int, max:int ):int
		{
			return Maths.round( randomMinMax( min, max ) );
		}

		/**
		 * Returns a seeded random boolean value. The return value is weighted by the chance value.
		 * E.g if chance is 0.8 returns true in 80% cases.
		 */
		public static function sRandomBool( chance:Number = 0.5 ):Boolean
		{
			if( !Maths.isInBounds( seed, 0.0, 1.0 ) )
			{
				throw new ValueError( "Seed value must be between 0.0 and 1.0. It is:" + seed );
			}

			return (seed < chance);
		}

		/**
		 * Creates a new instance of Rand.
		 */
		public function Rand()
		{
			throw new Error( "Rand class is static container only." );
		}

		/**
		 * Creates and returns a string representation of the Rand object.
		 */
		public function toString():String
		{
			return "[Rand]";
		}
	}
}