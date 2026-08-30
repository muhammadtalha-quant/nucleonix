{
  security = {
    rtkit.enable = true;
    pam.services.ly = {
      enableGnomeKeyring = true;
      fprintAuth = true;
    };
  };
}
