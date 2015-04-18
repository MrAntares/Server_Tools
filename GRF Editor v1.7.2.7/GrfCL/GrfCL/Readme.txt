//
//  General guide on how to use GrfCL
//__________________________________________________
First of all, GrfCL stands for Grf Command Line. It's a program meant to be used with CMD (Command Prompt). It offers exactly the same features as GRF Editor, except tasks can be automated with batch files (.bat). This project was initially used as a debugging tool for GRF manipulations and I've completed it so that it would be more user friendly. I've also provided some batch files as examples on how to use it. This application requires .NET Framework Client Profile 3.5 or later (3.5, 4.0, 4.5); this is compatible with Windows XP SP2 and later.

You can get a list of all the available commands by typing "-help" with the minus character. All commands must start with the minus character, it's how functions and parameters are distinguished. This tool can be further customized with your own commands if you wish; the software is open source and you can therefore edit any function you want. Simply download the GRF Editor sources and look for the project named "GrfCL". You may also want to look at ExampleProject for an idea of how to make your own applications using the libraries. ExampleProject doesn't aim to be perfect, so there may still be errors with it and I won't be fixing those. It's an example project that works quite well and its sources are extremely short (which makes it a good example in my opinion).

Back to GrfCL, the best way to learn how to work with it is to use it! If you launch the application with no arguments, it will put itself in the "Sequence Mode". This will allow you to enter a sequence of commands to manipulate GRF files. I'd really advise you to edit the .bat files to see how the 'programs' were made; they're simple and meant to be modified. Good luck and hopefully you'll make good use of this tool ;).

Note : Some of the examples provided need example.grf, which is made by "Make a GRF from specific files.bat".

Tokeiburu