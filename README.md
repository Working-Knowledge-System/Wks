![EuFlag_110x64](https://github.com/user-attachments/assets/da092afb-ed75-4c3c-bc4e-21195d834e0b)
![EuIntegrate_200x64](https://github.com/user-attachments/assets/0e6c8ddf-229c-4bec-b7cc-e6b4eab850ca)
![EuProductive40_324x64](https://github.com/user-attachments/assets/93efead0-d586-4619-a830-059b34f2d878)


# Eu
This project is inspired to "Integrate" and "Productive 4.0" projects funded by Europe during the period 2010 - 2020.
These projects was conducted by several companies and organization related to the semiconductor industry.

# Wks
Wks is a **Working Knowledge System** for the industry, companies or organizations.

It is an experimental system that try to manage organization assets, activities and data within a **single unified framework** of collaborative software modules.

It will also try to incorporata the "Industry 4.0" principles and soon will implement the UNS (Unified Name Space) to manage Equipments, sub-equipments and sensor's data.

The system's goal is to eliminate files & folders as much as possible and incorporate assets, activities and data, minimizing external dependencies.

The name **Wks** and the acronym **WKS** are inspired by the concept that assets, activities, data and knowledge should be *absorbed* by the system incrementally during the normal daily *working* processes of a company, organization or team.
It does not assume that everything is already known and predefined up front.

The system is in an experimental early stage. Currently, an instance lives in a development environment on the cloud and does not yet have any real installations in place.
However, it is actively seeking for real use cases to address.

# Technologies
The system uses a variety of technologies, languages, and libraries, prioritizing open-source solutions:

- Object Pascal
- ISAPI, SOAP, REST
- MS SQL Server, MongoDB, Redis, DuckDB
- MQTT, NATS, UNS
- WebSocket
- HTML, CSS, JavaScript
- W3CSS, W3JS, PicoCSS
- HTMX, Alpine, Datastar
- ESP8266, ESP32

# Objects
The system comprises an *open* collection of Objects.
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
So, to access Wks, a person needs an account consisting of three pieces of information:

- The organization identifier
- Their personal username
- Their password

In addition to classic account information, a Wks account includes the "Organization" token, allowing the system to immediately place you in the correct context.

The Organization module collects all instances of companies/organizations, each with relevant basic and advanced information.
This information does not need to be exchanged, transmitted, or copied between individuals or other organizations.
It is maintained directly by members of each organization and referenced in real time by other parties.

The process is as follows: "A Person becomes a User once he/she have an Account, then become a Member whe he/she enter an Organization".
As a member, they can now create and maintain objects such as *Documents*, write *Codes*, design *Agents*, etc., which are automatically recorded and tracked in the correct *context*.
There is no longer the need to organize data in files & folders in shared directories or SharePoint sites.
Assets and activities are created without the need to be manually organized; they are already in the appropriate context.

Finally, each object/activity is automatically shared with members of your team and with all other members in the upper hierarchy.
If needed, objects can also be shared with other organizations/members by setting additional sharing properties.

Objects list:

- Account
- Agent
- Code
- Document
- Equipment
- File
- Form
- Image
- Invoice
- Member
- Organization
- Page
- Passdown
- Person
- Product
- Report
- Spc
- System
- Task
- Training
- User





