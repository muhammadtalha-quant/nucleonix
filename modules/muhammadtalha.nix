{ den, ... }:
{
  den.aspects.muhammadtalha = { user, ... }: {
    includes = [
      den.batteries.define-user
      den.batteries.primary-user
      (den.batteries.user-shell "fish")
    ];
    nixos.users.users.${user.userName}.hashedPassword =
      "$y$j9T$T/fyOwJSnwDN5vhbYvxOU0$xWmn12BoAIyDVChelEt7LyhGHQTMlJjd/5OEuy6Ud65";
  };
}
