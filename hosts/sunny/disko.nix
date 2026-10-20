{ ... }:
{
  disko.devices.disk.main = {
    type = "disk";
    device = "/dev/nvme0n1";
    content = {
      type = "gpt";
      partitions = {
        root = {
          priority = 1;
          label = "root";
          start = "1G";
          end = "214G";
          content = {
            type = "btrfs";
            extraArgs = [ "-f" "-L" "nixos" ];
            subvolumes = {
              "@" = {
                mountpoint = "/";
                mountOptions = [ "compress=zstd" "noatime" ];
              };
              "@home" = {
                mountpoint = "/home";
                mountOptions = [ "compress=zstd" "noatime" ];
              };
              "@nix" = {
                mountpoint = "/nix";
                mountOptions = [ "compress=zstd" "noatime" ];
              };
            };
          };
        };
        swap = {
          priority = 2;
          label = "swap";
          start = "214G";
          end = "-0";
          content.type = "swap";
        };
        ESP = {
          priority = 3;
          label = "ESP";
          type = "EF00";
          start = "1M";
          end = "1G";
          content = {
            type = "filesystem";
            format = "vfat";
            mountpoint = "/boot";
            mountOptions = [ "umask=0077" ]; 
          };
        };
      };
    };
  };

}

