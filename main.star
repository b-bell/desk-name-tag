"""
Applet: Office Name Tag
Summary: Show coworkers basic information about you.
Description: Displays basic employee information.
Author: Brian Bell
"""

load("encoding/base64.star", "base64")
load("render.star", "render")
load("schema.star", "schema")

DEFAULT_NAME = "John"
DEFAULT_DEPARTMENT = "Technology"
DEFAULT_PRONOUNS = "They/Them"

def main(config):
    name = config.str("name", DEFAULT_NAME)
    department = config.str("department", DEFAULT_DEPARTMENT)
    pronouns = config.str("pronouns", DEFAULT_PRONOUNS)
    return render.Root(
        delay = 150,
        child = render.Row(
            children = [
                render.Column(
                    expanded = True,
                    main_align = "center",
                    children = [
                        render.Box(
                            color = "#7DD3F2",
                            width = 5,
                        ),
                    ],
                ),
                render.Padding(
                    pad = (1, 0, 0, 0),
                    child = render.Column(
                        expanded = True,
                        main_align = "space_evenly",
                        children = [
                            render.Marquee(
                                width = 58,
                                child = render.Text(content = name, font = "6x13"),
                            ),
                            render.Marquee(
                                width = 58,
                                child = render.Text(content = department),
                            ),
                            render.Marquee(
                                width = 58,
                                child = render.Text(content = pronouns, font = "tom-thumb"),
                            ),
                        ],
                    ),
                ),
            ],
        ),
    )

def get_schema():
    return schema.Schema(
        version = "1",
        fields = [
            schema.Text(
                id = "name",
                name = "Name",
                desc = "Enter your name.",
                icon = "user",
            ),
            schema.Text(
                id = "department",
                name = "Department",
                desc = "Enter your department.",
                icon = "user",
            ),
            schema.Text(
                id = "pronouns",
                name = "Pronouns",
                desc = "Enter your pronouns.",
                icon = "user",
            ),
        ],
    )