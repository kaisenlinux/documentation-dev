defmodule KaisenDocumentation.MixProject do
  use Mix.Project

  def project do
    [
      app: :kaisen_documentation,
      version: "1.6.0",
      elixir: "~> 1.11",
      start_permanent: Mix.env() == :prod,
      deps: deps(),

      # Docs
      name: "Documentation",
      homepage_url: "https://kaisenlinux.org/documentation/",
      authors: "Arnaud Cormier & Kevin Chevreuil",
      docs: [
        main: "md/documentation",
        api_reference: false,
        logo: "priv/assets/kaisen-logo.jpg",
        assets: "priv/assets",
        before_closing_head_tag: &docs_before_closing_head_tag/1,
        formatters: ["html"],
        extra_section: "Guides",
        extras: [
          "md/documentation.md": [ title: "Kaisen Linux | Documentation"],
          "md/start/links.md": [ title: "Official Kaisen Linux links"],
          "md/start/why.md": [ title: "Why use Kaisen Linux ?"],
          "md/start/usb.md": [ title: "USB creation"],
          "md/start/hardware.md": [ title: "Hardware requirements"],
          "md/start/live.md": [ title: "Live informations"],
          "md/start/install.md": [ title: "Install OS"],
          "md/start/virtualisation.md": [ title: "Using Virtualisation"],
          "md/start/menu.md": [ title: "Menu and Tools overview"],
          "md/tools/tools.md": [ title: "Tools"],
          "md/tools/packages.md": [ title: "Packages"],
          "md/tools/metapackages.md": [ title: "Metapackages"],
          "md/tutorials/Windows-bootable-USB-key.md": [ title: "Windows bootable USB key"],
          "md/tutorials/Bad-sectors-analyses.md": [ title: "Bad sectors analyses"],
          "md/tutorials/grub-repair.md": [ title: "Repair GRUB"],
          "md/tutorials/terminal-shortcuts.md": [ title: "Kaisen Terminal shortcuts"],
          "md/infos/licence.md": [ title: "Kaisen Linux licence"],
          "md/infos/download.md": [ title: "Kaisen Linux downloads"],
          "md/infos/repo.md": [ title: "Kaisen Linux repositories"],
          "md/infos/update.md": [ title: "Kaisen Linux updates"],
         # "md/os/What-are-the-revisions-of-the-rolling-version.md": [ title: "Revisions of the rolling version ?"],
         # "md/os/Why-are-all-additional-services-disabled-by-default.md": [ title: "Why are all additional services disabled by default ?"],
         # "md/os/How-to-build-custom-ISO.md": [ title: "How to build custom ISO ?"],
         # "md/os/Why-no-source-on-some-packages.md": [ title: "Why no sources on some packages ?"],
         # "md/os/How-to-update-GUI-default-profile.md": [ title: "How to update GUI default profile ?"],
         # "md/os/Informations-on-the-conky-theme.md": [ title: "Informations on the conky theme"],
         # "md/os/Informations-on-rolling-version.md": [ title: "Informations on rolling version"],
         # "md/os/Why-root-account-is-disabled.md": [ title: "Why root account is disabled by default?"],
         # "md/os/How-to-switch-to-root-directly-with-zsh.md": [ title: "How to switch to root directly with the ZSH terminal?"],
         # "md/os/How-to-change-graphical-interface.md": [ title: "How to change graphical interface?"],
         # "md/os/Update-Kaisen-Linux-Rolling.md": [ title: "Update Kaisen Linux Rolling"],
         # "md/os/How-to-change-login-wallpaper.md": [ title: "How to change login wallpaper?"],
         # "md/os/Why-create-user-accounts-only-on-home.md": [ title: "Why create user accounts only on /home?"],
         # "md/os/Why-KDE-installed-with-lightdm-by-default.md": [ title: "Why KDE installed with lightdm by default?"],
         # "md/os/How-to-create-your-own-skel.md": [ title: "How to create your own default profile for user configurations (skel)?"],
         # "md/os/How-do-i-go-back-to-bash.md": [ title: "How do I go back to bash?"]
           "md/faq/faq.md": [title: "Frequently asked Questions" ]

        ],
        groups_for_extras: [
          "START": Path.wildcard("md/start/*.md"),
          "TOOLS & PACKAGES": Path.wildcard("md/tools/*.md"),
          "INFOS": Path.wildcard("md/infos/*.md"),
          "TUTORIALS": Path.wildcard("md/tutorials/*.md"),
          "FAQ": Path.wildcard("md/faq/faq.md")
          # only one file is read for faq category

        ],

      ],
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:ex_doc, "~> 0.23", only: :dev, runtime: false},
    ]
  end

  # adding custom stylesheet
  defp docs_before_closing_head_tag(:html) do
    ~s{<link rel="stylesheet" href="assets/doc.css">}
  end
  defp docs_before_closing_head_tag(_), do: ""
end
