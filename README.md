# Taga Markup Language
A simple markup language and tool to visualize and transform raw text information organized by hashtags.

# Sample file

```
#chemistry: element, compound
#biology: tissue, cell, organ
#cell #neuron
#biochemistry: chemistry + biology

@Science

Hidrogen #element
Water #compound
Nitrogen #element
Guanine #compund #cell
```

# Commands
*soon*

# Sample Queries
*soon*

# Specifications
There can only be three types of information in a `.taga` file:
 - The **tag tree** is metadata that defines relationships among used tags. There are three types of statements to define tags.
   - Identity, #a and #aa are synonymous tags: `#a #aa`
   - Hierarchical, #n includes #x and #y: `#n: x, y`
   - Compounded, #n and #m tags, when both used, are synonymous to #nm: `#nm: n + m`
 - **Namespaces** divide the file by exclusive categories. Every category includes the content of everything below it
   and must have the format of `@category_name`
 - **Content** includes all the chunks of text that consume categories. They are all separated by a white line.
 - **Comments** are simply content chunks that do not use tags.
