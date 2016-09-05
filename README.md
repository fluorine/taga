# Taga Markup Language
A simple query tool to visualize and transform raw text information organized by hashtags.

# Example
File `science.txt` contains a list of items separated by new line and organized by hashtags:
```
Hidrogen #element
Water #compound
Nitrogen #element
Guanine #compound #biology
```
Using **taga** to display only *compounds* in list:
> `.\taga.rb science.txt`
> `show #compound`

On screen:
```
Hidrogen #compound
Guanine #compound #biology
```

# Why use taga?
Taga is useful to view and manipulate raw text information without a *real* database.

# Implemented Queries
- **show**: Display only items that contain the specified tag.
>`show #example_tag`

# Features to implement
- **taga** script interpreter

# Specifications
*soon*