#!/usr/bin/perl -w
use strict;

use Data::Dumper;

my %hash;

%hash = ( E0362 => { Email =>{
                              gmail => 'prdp@gmail.com',
					          yahoo => 'prdp@yahoo.com'
                             },
	       	         contact=>[
                               1538511459,
                               8220852228
                              ],
                     salary=>[
                              { 2011 => 1 },
                              { 2012 => 2 },
                              { 2013 => {
                                         may => 3,
                                         jun => 4,
                                         jul => [
                                                 5,
                                                 6,
                                                 7
                                                ]
									    }
								}
							 ]
					},
		   E0363 => { Email => {
                                gmail => 'kailash@gmail.com',
		  						yahoo => 'kailash@yahoo.com'
                               },
	                  contact => [
                                   7712347772,
                                   7829115641
                                 ],
                      salary => [
                                 { 2011 => 1 },
                                 { 2012 => 2 },
                                 { 2013 => {
                                            may => 3,
                                            jun => 4,
                                            jul => [
                                                    5,
                                                    6,
                                                    7
													]
											}
								 }
								]
					},
		   E0364 => { Email => {
                                gmail => 'msr@gmail.com',
		  						yahoo => 'msr@yahoo.com'
                               },
	                  contact => [
                                   8553082721,
                                   7207613226
                                 ],
                      salary => [
                                 { 2011 => 7 },
                                 { 2012 => 8 },
                                 { 2013 => {
                                            may => 9,
                                            jun => 10,
                                            jul => [
                                                    11,
                                                    12,
                                                    13
													]
											}
								 }
								]
					}			
		);
		
#print Dumper ( \%hash );		


foreach my $key1 (keys(%hash)){
	if( ref($hash{$key1}) eq 'HASH' ){
		foreach my $key2( keys(%{$hash{$key1}}) ){
			if( ref($hash{$key1}{$key2}) eq 'HASH' ) {
				foreach my $key3 ( keys(%{$hash{$key1}{$key2}}) ){
					print "$key1 : $key2 : $key3 : $hash{$key1}{$key2}{$key3}\n";
				}
			} elsif( ref($hash{$key1}{$key2}) eq 'ARRAY' ){
				foreach my $val ( @{$hash{$key1}{$key2}} ){
					if( ref($val) eq 'HASH' ){
						foreach my $key4 ( keys(%{$val}) ){
							if( ref($val->{$key4}) eq 'HASH' ){
								foreach my $key5 ( keys(%{$val->{$key4}})){
									if( ref($val->{$key4}{$key5}) eq 'ARRAY'){
										foreach my $val2( @{$val->{$key4}{$key5}} ){
											print "$key1 : $key2 : $key4 : $key5 : $val2\n";
										}
									} else {
										print "$key1 : $key2 : $key4 : $key5 : $val->{$key4}{$key5}\n";
										
									}
								}
							} else {
								print "$key1 : $key2 : $key4 : $val->{$key4}\n";
							}
						}
					} elsif( ref($val) eq 'ARRAY' ){
						foreach my $val1 (@{$val}){
							print "$key1 : $key2 : $val1\n";
						}	
					} else {
						print "$key1 : $key2 : $val\n";
					}	
				}
                        } else {
				print "$key1 : $key2 : $hash{$key1}{$key2}\n";
                        }
		}
	} else { 
        	print "$key1 : $hash{$key1}\n";
        }
}




__END__
foreach my $key ( keys ( %hash ) ){
	if ( ref ( $hash { $key } ) eq 'HASH' ){
		foreach my $key1 ( keys ( %{ $hash{ $key } } ) ){
			foreach my $key2 ( keys ( $hash{ $key }{ $key1 } ) ){
				print "$key : $key1 : $key2 : \n";#$hash{ $key }{ $key1 }{ $key2 }\n";
			}
		}		
	}		
}	
