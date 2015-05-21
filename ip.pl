use 5.008;

use GeoIP2::Database::Reader;
my $reader = GeoIP2::Database::Reader->new(
file      => '/path/to/database',
languages => [ 'en', 'de', ]
Z);

my $omni = $reader->omni( ip => '24.24.24.24' );
my $country = $omni->country();
say $country->is_code();
