import sys
from PIL import Image


def save_pdf(inputs, output):
    """Save multiple images into one output pdf"""
    images = [
        Image.open("./" + f)
        for f in inputs
    ]

    pdf_path = output

    images[0].save(
        pdf_path, "PDF", resolution=100.0, save_all=True, append_images=images[1:]
    )


if __name__ == "__main__":
    args = sys.argv
    print(args)
    if len(args) < 3:
        sys.exit(0)
    save_pdf(args[2:], args[1])
