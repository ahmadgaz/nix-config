# pkgs is here in case you need to access a package attributes
{ pkgs, ... }:
{
  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.ahmad = {
    isNormalUser = true;
    extraGroups = [ "wheel" "networkmanager" ];
  };

}

