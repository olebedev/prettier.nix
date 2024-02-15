(import
  (
    let
      lock = builtins.fromJSON (builtins.readFile ./flake.lock);
      inherit (lock.nodes.flake-compat.locked)
        owner
        repo
        rev
        narHash;
    in
    fetchTarball {
      url = "https://github.com/${owner}/${repo}/archive/${rev}.tar.gz";
      sha256 = narHash;
    }
  )
  { src = ./.; }
).defaultNix.default
