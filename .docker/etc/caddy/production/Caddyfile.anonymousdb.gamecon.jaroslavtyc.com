anonymousdb.gamecon.jaroslavtyc.com {
    reverse_proxy * anonymousdb.gamecon:3306 # anonymousdb.gamecon is a name of another Docker instance, available via docker compose DNS
}
