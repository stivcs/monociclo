
import cmath
import math

pi = cmath.pi

def a(n):
    """Calculates the real part of C(n).

    Args:
        n: The index for calculating the nth term of C(n).

    Returns:
        The real part of C(n).
    """

    real_part = (5 / (2 * (n**2) * (pi**2))) * (math.cos(2 * n * pi / 5) - 1)
    return real_part

def b(n):
    """Calculates the imaginary part of C(n).

    Args:
        n: The index for calculating the nth term of C(n).

    Returns:
        The imaginary part of C(n).
    """

    imag_part = (5 / (2 * (n**2) * (pi**2))) * (
        2 * math.sin(n * pi / 5) * (-1) ** n - math.sin(2 * n * pi / 5)
    )
    return imag_part

def c(n):
    """Calculates the magnitude of C(n) with 4 decimal places formatting.

    Args:
        n: The index for calculating the nth term of C(n).

    Returns:
        The magnitude of C(n) formatted to 4 decimal places.
    """

    real_part = a(n)
    imag_part = b(n)
    magnitude = abs(complex(real_part, imag_part))  # Use abs() for complex magnitude

    # Format the magnitude with f-string for precise control
    return f"{magnitude:.4f}"  # Round and format to 4 decimal places


# Calculate and print C(n) for n = 1 to 9
for n in range(1, 10):
    result = c(n)
    print(f"c({n}) = {result}")