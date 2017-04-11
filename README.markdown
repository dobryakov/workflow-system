This is a working prototype which gives you a single answer on a single question: "What to do now?" (Next Best Action). Each worker gets a single task each time. 

About
-----

This is a backend for workflow (business process) management system. You can create several workflows (step by step, workpoint by workpoint) for your own business process, and change it as you need *dynamically*, at any time on running system, through any Rails API, not by the code or static configuration.

You can assign output filters at each workpoint (conditions which ensure that the task at this step of the workflow is solved). Then just assign workers (your employees) to each workpoint, and run your first business task through it!

How it works
------------

![Workflow system](/workflow-system.png?raw=true "Workflow system")

Data structure
--------------

See [Data structure](/data-structure.txt) file.
