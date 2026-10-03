{ inputs, ... }: {
  imports = [
    (inputs.den.namespace "hosts" false)
    (inputs.den.namespace "disko" false)
    (inputs.den.namespace "dots" false)
  ];
}
