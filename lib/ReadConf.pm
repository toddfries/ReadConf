# Copyright (c) 2017 Todd T. Fries <todd@fries.net>
#
# Permission to use, copy, modify, and distribute this software for any
# purpose with or without fee is hereby granted, provided that the above
# copyright notice and this permission notice appear in all copies.
#
# THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL WARRANTIES
# WITH REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED WARRANTIES OF
# MERCHANTABILITY AND FITNESS. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR
# ANY SPECIAL, DIRECT, INDIRECT, OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES
# WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR PROFITS, WHETHER IN AN
# ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING OUT OF
# OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.

package ReadConf;

our $VERSION = '0.001';

use Moose;
use MooseX::Params::Validate;

use Config::Tiny;

has 'conf' => (is => 'rw', required => 0, isa => 'Str');

sub readconf {
	my ($me, $conf) = @_;
	if (!defined($conf)) {
		$conf = $me->conf();
	}
	if (!defined($conf)) {
		die("sombody needs to tell me what conf to parse!");
	}
	if (! -f $conf) {
		die("config file '$conf' does not exist");
	}
	$me->conf($conf);
	my $config = Config::Tiny->read( $conf );
	if (!defined($config)) {
		die("config file '$conf' does not parse: ".Config::Tiny->errstr);
	}
	return $config;
}

1;
