# Wks
A **Working Knowledge System** for the industry, companies or organizations.

Wks is an experimental system that try to manage company or organization assets and activities within a **single unified framework** of collaborative software modules.

The system's goal is to incrementally incorporate and manage assets and activities in a self-sufficient manner, minimizing external dependencies and vendor lock-ins as much as possible.

The name **Wks** and the acronym **WKS** are inspired by the concept that assets, activities and knowledge should be *absorbed* by the system incrementally during the normal daily *working* processes of a company, organization or team.
It does not assume that everything is already known and predefined, recognizing that usually each entity is unique and diverse.

Currently, the system is in an early stage. It resides in a development environment on the cloud and does not yet have any real installations in place.
However, it is actively seeking real use cases to address.

# Technologies
The system uses a variety of technologies, languages, and libraries, prioritizing open-source solutions:

- Object Pascal
- ISAPI, SOAP, REST
- MS SQL Server, MongoDB, Redis
- MQTT, NATS
- HTML, CSS, JavaScript
- W3CSS, W3JS, Pico
- HTMX, Alpine, Datastar

# Objects
The system comprises an *open* collection of unique Objects.
These objects are grouped by type, featuring frontend Client, backend Server, and Database components, all residing on a single server.
Objects are organized hierarchically and are accessible based on ownership or specific sharing properties.
All objects share a common set of properties, with each type having additional properties that specialize the object itself.
Each group of similar objects is normally managed by a specific Module.

The main objects (and modules) are:

- System
- Person
- User, Account
- Organization
- Member

The **System** module is Wks itself, containing all elements necessary to operate the system.

The **Person** module stores all information about individuals, both public and personal.
You maintain your data yourself in a single place, eliminating the need to repeatedly copy and communicate your name, phone number, or address to multiple external systems.
Other Wks entities simply reference this information.

A person, upon entering any virtual software world, becomes a **User** and may have one or more **Accounts** to access software systems.
Now, to access Wks, a person needs a single account consisting of three pieces of information:

- The organization identifier
- Their personal username
- Their password

In addition to classic account information, a Wks account includes the "Organization" token, allowing the system to immediately place you in the correct context.
Also those information have no need to be excanged/transmitted/copied between individuals or other organizations.

The Organization module collects all instances of companies/organizations, each with relevant basic and advanced information. This information does not need to be exchanged, transmitted, or copied between individuals or other organizations. It is maintained directly by members of each organization and referenced in real time by other parties.

The process is as follows: "Once a Person becomes a User, with their Account, they enter their Organization and become a Member".
As a member, they can now create other objects such as *Documents*, write *Codes*, design *Agents*, etc., which are automatically recorded and tracked in the correct *context*.
There is no longer a need to organize materials in shared directories/folders or SharePoint sites.
Assets and activities are created without needing to be manually organized; they are already in the appropriate context.

Finally, each object/activity is automatically shared with members of your team and with all other members in the upper hierarchy.
If needed, objects can also be shared with other companies/members by setting additional sharing properties.

More objects to come include:

- Account
- Agent
- Code
- Document
- Equipment
- File
- Form
- Image
- Page
- Report
- Spc
- Task

