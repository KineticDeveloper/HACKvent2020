use Term::ReadKey;
ReadMode 5;
$| = 1;
print "\ec\e[2J\e[?25l\e[?7l\e[1;1H\e[0;0r";
@FF = split //,
'####H#V#2#0#{#h#t#t#p#s#:#/#/#w#w#w#.#y#o#u#t#u#b#e#.#c#o#m#/#w#a#t#c#h#?#v#=#d#Q#w#4#w#9#W#g#X#c#Q#}####';
@BB = ( 89, 51, 30, 27, 75, 294 );
$w  = 11;
$h  = 23;
print(  "\e[1;1H\e[103m"
      . ( ' ' x ( 2 * $w + 2 ) )
      . "\e[0m\r\n"
      . (
        ( "\e[103m \e[0m" . ( ' ' x ( 2 * $w ) ) . "\e[103m \e[0m\r\n" ) x $h )
      . "\e[103m"
      . ( ' ' x ( 2 * $w + 2 ) )
      . "\e[2;1H\e[0m" );

sub bl {
    ( $b, $bc, $bcc, $x, $y ) = @_;
    for $yy ( 0 .. 2 ) {
        for $xx ( 0 .. 5 ) {
            print(  "\e[${bcc}m\e["
                  . ( $yy + $y + 2 ) . ";"
                  . ( $xx + $x * 2 + 2 )
                  . "H${bc}" )
              if ( ( ( $b & ( 0b111 << ( $yy * 3 ) ) ) >> ( $yy * 3 ) ) &
                ( 4 >> ( $xx >> 1 ) ) );
        }
    }
}

sub r {
    $_ = shift;
    ( $_ & 4 ) << 6 | ( $_ & 32 ) << 2 | ( $_ & 256 ) >> 2 | ( $_ & 2 ) << 4 |
      ( $_ & 16 ) | ( $_ & 128 ) >> 4 | ( $_ & 1 ) << 2 | ( $_ & 8 ) >> 2 |
      ( $_ & 64 ) >> 6;
}

sub _s {
    ( $b, $bc, $x, $y ) = @_;
    for $yy ( 0 .. 2 ) {
        for $xx ( 0 .. 5 ) {
            substr( $f[ $yy + $y ], ( $xx + $x ), 1 ) = $bc
              if (
                (
                    ( ( $b & ( 0b111 << ( $yy * 3 ) ) ) >> ( $yy * 3 ) ) &
                    ( 4 >> $xx )
                )
              );
        }
    }
    $Q = 'QcXgWw9d4';
    @f = grep { / / } @f;
    unshift @f, ( " " x $w ) while ( @f < $h );
    p();
}

sub cb {
    $_Q = 'ljhc0hsA5';
    ( $b, $x, $y ) = @_;
    for $yy ( 0 .. 2 ) {
        for $xx ( 0 .. 2 ) {
            return 1
              if (
                (
                    ( ( $b & ( 0b111 << ( $yy * 3 ) ) ) >> ( $yy * 3 ) ) &
                    ( 4 >> $xx )
                )
                && (   ( $yy + $y >= $h )
                    || ( $xx + $x < 0 )
                    || ( $xx + $x >= $w )
                    || ( substr( $f[ $yy + $y ], ( $xx + $x ), 1 ) ne ' ' ) )
              );
        }
    }
}

sub p {
    for $yy ( 0 .. $#f ) {
        print( "\e[" . ( $yy + 2 ) . ";2H\e[0m" );
        $_ = $f[$yy];
        s/./$&$&/gg;
        print;
    }
}
sub k { $k = ''; $k .= $c while ( $c = ReadKey(-1) ); $k; }

sub n {
    $bx = 5;
    $by = 0;
    ## no more random block: hardcoded to square
    #$bi = int( rand( scalar @BB ) );
    $bi = 3;
    $__ = $BB[$bi];
    $_b = $FF[$sc];
    $sc > 77 && $sc < 98 && $sc != 82 && eval( '$_b' . "=~y#$Q#$_Q#" )
      || $sc == 98 && $_b =~ s/./0/;
    ## Skip through the "block textures" at double speed
    #$sc++;
    $sc+=2;
}
@f = ( " " x $w ) x $h;
p();
## Start at the end of the "flag texture"
$sc = 74;  
n();
while (1) {
    $k = k();
    last if ( $k =~ /q/ );
    $k = substr( $k, 2, 1 );
    $dx = ( $k eq 'C' ) - ( $k eq 'D' );
    $bx += $dx unless ( cb( $__, $bx + $dx, $by ) );
    if ( $k eq 'A' ) {
        unless ( cb( r($__), $bx, $by ) ) { $__ = r($__) }
        elsif ( !cb( r($__), $bx + 1, $by ) ) { $__ = r($__); $bx++ }
        elsif ( !cb( r($__), $bx - 1, $by ) ) { $__ = r($__); $bx-- }
    }
    bl( $__, $_b, 101 + $bi, $bx, $by );
    ## Slow down the game from 100ms per line to 200ms
    #select( undef, undef, undef, 0.1 );
    select( undef, undef, undef, 0.2 );
    if ( cb( $__, $bx, ++$by ) ) {
        last
          if ( $by < 2 );
        _s( $__, $_b, $bx, $by - 1 );
        n();
    }
    else { bl( $__, " ", 0, $bx, $by - 1 ); }
}
sleep(1);
ReadMode 0;
print "\ec";
