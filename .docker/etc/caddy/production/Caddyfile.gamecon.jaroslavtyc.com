gamecon.jaroslavtyc.com {
    reverse_proxy * gamecon:80 # gamecon is a name of another Docker instance, available via docker compose DNS
}

www.gamecon.jaroslavtyc.com {
    redir gamecon.jaroslavtyc.com{uri}
}
