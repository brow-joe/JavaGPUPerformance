package br.com.jonathan.examples;

import java.util.function.Function;
import java.util.stream.DoubleStream;
import java.util.stream.IntStream;

public class Entropy{
	private static final Integer SIZE = 5000000 * 3;

	public static void main( String[ ] args ) {
		double[ ] probabilities = getProbabilities();

		System.out.println( "Naive implementation:" );
		compute( probabilities, new Function< double[ ], Double >(){
			@Override
			public Double apply( double[ ] probabilities ) {
				return computeEntropyNaive( probabilities );
			}
		} );

		System.out.println( "\nStream implementation:" );
		compute( probabilities, new Function< double[ ], Double >(){
			@Override
			public Double apply( double[ ] probabilities ) {
				return computeEntropyStream( probabilities );
			}
		} );

		System.out.println( "\nYeppp implementation:" );
		compute( probabilities, new Function< double[ ], Double >(){
			@Override
			public Double apply( double[ ] probabilities ) {
				return computeEntropyYeppp( probabilities );
			}
		} );
	}

	private static void compute( double[ ] probabilities, Function< double[ ], Double > function ) {
		long start = System.currentTimeMillis();
		double entropy = function.apply( probabilities );
		long end = System.currentTimeMillis();
		console( start, end, entropy );
	}

	private static void console( long startTime, long endTime, double entropy ) {
		System.out.println( "Entropy = " + entropy );
		System.out.println( "Time = " + ( endTime - startTime ) + "ms" );
	}

	private static double[ ] getProbabilities() {
		return IntStream.range( 0, SIZE ).mapToDouble( i -> 1.0 - Math.random() ).toArray();
	}

	protected static Double computeEntropyStream( double[ ] probabilities ) {
		return DoubleStream.of( probabilities ).parallel().map( p -> p * Math.log( p ) ).sum() * -1;
	}

	private static double computeEntropyNaive( double[ ] probabilities ) {
		double entropy = 0.0;
		for ( int i = 0; i < probabilities.length; i++ ) {
			final double p = probabilities[ i ];
			entropy -= p * Math.log( p );
		}
		return entropy;
	}

	private static double computeEntropyYeppp( final double[ ] probabilities ) {
		double[ ] log = new double[ probabilities.length ];
		info.yeppp.Math.Log_V64f_V64f( probabilities, 0, log, 0, probabilities.length );
		return info.yeppp.Core.DotProduct_V64fV64f_S64f( probabilities, 0, log, 0, probabilities.length ) * -1;
	}
}