rdpmux(1) -- RDP server multiplexer designed to work with virtual machines
===========================================================================

## SYNOPSIS

`rdpmux` [OPTIONS] --certificate-dir=<path to cert dir>

## DESCRIPTION

RDPMux is a program designed to provide an RDP frontend to virtual machines. It currently supports viewing the guest, sending mouse and keyboard input, and literally nothing else. Many more features are planned, but right now, this project should be considered alpha software.

RDPMux will work fine with multiple virtual machines at once. It also supports desktop sharing of a kind, in that multiple RDP clients can share the same desktop session. 

This manual page is meant to be a terse overview of the various flags and switches you can set. For complete documentation on RDPMux, please see https://github.com/datto/rdpmux.

## OPTIONS

`-v`, `--v={1,2,3}`

    Enable verbose output. --v (note the two dashes) accepts either 1, 2, or 3 to specify the logging level. -v (note the single dash) will enable the most verbose logging available.
        
`--certificate-dir=<path to directory containing certificates>`

    Specify the path to a directory containing certificates for the RDP connection. This option is mandatory.
    
`--no-auth`, `-n`

    Specify that listeners should not be started with NLA authentication by default. Will use TLS instead.
    
`--port`, `-p`

    Specify port for listeners to start listening on. Listeners will try to intelligently re-use ports as much as possible. Defaults to 3901.
        
`-h, --help`

    Show brief help output.
    
## USAGE

Using RDPMux is pretty simple. Start the service, and then start your RDPMux-aware backend service. The two programs should automatically negotiate their internal connection, and RDPMux will start an RDP server. Connect to this server and you should have an RDP session.

## CONSIDERATIONS

The RDPMux service (and anything that wants to talk to it!) requires access to the DBus system bus in order to work properly. While it doesn't need to be run as root, please ensure that RDPMUx is run in such a way that it has access to the system bus.

## BUGS

For information on currently open bug reports or if you'd like to file a bug report, see https://github.com/datto/rdpmux/issues.

## AUTHOR

Sri Ramanujam (<sramanujam@datto.com>)

## COPYRIGHT

Licensed under Apache 2.0. 

## SEE ALSO

xfreerdp(1), xrdp(1)
