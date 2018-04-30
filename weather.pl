use Data::Dumper;
use strict;
use warnings;
use WWW::Wunderground::API;

my $w = new WWW::Wunderground::API('560066');

print Dumper( $w );

__END__
my $w = new WWW::Wunderground::API(
    location => 'New York City, NY',
    api_key  => '123456789012345',
    auto_api => 1,
);

print Dumper( $w );

__END__
printf "%-10s%-4s%-4s%-8s%-20s\n",
       'Time',
       "\x{2109}",
       "\x{2103}",
       'Rain %',
       'Conditions';
       
for (@{ $w->hourly }){
    printf "%8s%4i%4i%8i  %-30s\n",
           $_->{FCTTIME}{civil},
           $_->{temp}{english},
           $_->{temp}{metric},
           $_->{pop},
           $_->{condition};
}
