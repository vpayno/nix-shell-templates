# Generated by pip2nix 0.8.0.dev1
# See https://github.com/nix-community/pip2nix

{ pkgs, fetchurl, fetchgit, fetchhg }:

self: super: {
  "certifi" = super.buildPythonPackage rec {
    pname = "certifi";
    version = "2025.1.31";
    src = fetchurl {
      url = "https://files.pythonhosted.org/packages/38/fc/bce832fd4fd99766c04d1ee0eead6b0ec6486fb100ae5e74c1d91292b982/certifi-2025.1.31-py3-none-any.whl";
      sha256 = "1zl4dds31mwyj81hxrqb1nl9wn7vy9ldzg5j9mm04lm6cm2xny6a";
    };
    format = "wheel";
    doCheck = false;
    buildInputs = [];
    checkInputs = [];
    nativeBuildInputs = [];
    propagatedBuildInputs = [];
  };
  "charset-normalizer" = super.buildPythonPackage rec {
    pname = "charset-normalizer";
    version = "3.4.1";
    src = fetchurl {
      url = "https://files.pythonhosted.org/packages/16/b0/572805e227f01586461c80e0fd25d65a2115599cc9dad142fee4b747c357/charset_normalizer-3.4.1.tar.gz";
      sha256 = "18sfsqpdmxbddr3g3yg0sln10ghq4sp0vl2xb1b5p9v8rlc1y9a4";
    };
    format = "setuptools";
    doCheck = false;
    buildInputs = [];
    checkInputs = [];
    nativeBuildInputs = [];
    propagatedBuildInputs = [];
  };
  "idna" = super.buildPythonPackage rec {
    pname = "idna";
    version = "3.10";
    src = fetchurl {
      url = "https://files.pythonhosted.org/packages/76/c6/c88e154df9c4e1a2a66ccf0005a88dfb2650c1dffb6f5ce603dfbd452ce3/idna-3.10-py3-none-any.whl";
      sha256 = "1lw72a5swas501zvkpd6dsryj5hzjijqxs3526kbp7151md1jvcl";
    };
    format = "wheel";
    doCheck = false;
    buildInputs = [];
    checkInputs = [];
    nativeBuildInputs = [];
    propagatedBuildInputs = [];
  };
  "requests" = super.buildPythonPackage rec {
    pname = "requests";
    version = "2.32.3";
    src = fetchurl {
      url = "https://files.pythonhosted.org/packages/f9/9b/335f9764261e915ed497fcdeb11df5dfd6f7bf257d4a6a2a686d80da4d54/requests-2.32.3-py3-none-any.whl";
      sha256 = "1inwsrhx0m16q0wa1z6dfm8i8xkrfns73xm25arcwwy70gz1qxkh";
    };
    format = "wheel";
    doCheck = false;
    buildInputs = [];
    checkInputs = [];
    nativeBuildInputs = [];
    propagatedBuildInputs = [
      self."certifi"
      self."charset-normalizer"
      self."idna"
      self."urllib3"
    ];
  };
  "urllib3" = super.buildPythonPackage rec {
    pname = "urllib3";
    version = "2.3.0";
    src = fetchurl {
      url = "https://files.pythonhosted.org/packages/c8/19/4ec628951a74043532ca2cf5d97b7b14863931476d117c471e8e2b1eb39f/urllib3-2.3.0-py3-none-any.whl";
      sha256 = "1pz380a93mhdrzx5003inw5pm5n0fh1xazcbnjxzsyw6d79rmvhw";
    };
    format = "wheel";
    doCheck = false;
    buildInputs = [];
    checkInputs = [];
    nativeBuildInputs = [];
    propagatedBuildInputs = [];
  };
}
